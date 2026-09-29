-- Migration: 20260928_add_task_category_enum
-- Description: Adiciona enum TaskCategory e coluna category (opcional) na tabela tasks

-- Consulta 001: Criação do tipo enum TaskCategory
CREATE TYPE "TaskCategory" AS ENUM (
  'WORK',
  'STUDY',
  'PERSONAL',
  'HEALTH',
  'FINANCE',
  'OTHER'
);

-- Consulta 002: Adição da coluna category em tasks (nullable — sem valor padrão)
ALTER TABLE "tasks" ADD COLUMN "category" "TaskCategory";

-- Consulta 003: Índice para filtragem rápida por categoria
CREATE INDEX "tasks_category_idx" ON "tasks"("category");
